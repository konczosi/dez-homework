from pathlib import Path
import pandas as pd
from prefect import flow, task
from prefect_gcp.cloud_storage import GcsBucket
from prefect_gcp import GcpCredentials


def extract_from_gcs(color: str, year: int, month: int) -> Path:
    """ Download trip data from GCS """
    gcs_path = f"data/{color}/{color}_tripdata_{year}-{month:02}.parquet"
    gcs_block = GcsBucket.load("dez-gcs")
    gcs_block.get_directory(from_path=gcs_path, local_path=f"./")
    return Path(f"./{gcs_path}")


@task()
def write_bq(df: pd.DataFrame) -> None:
    """Write DataFrame to BiqQuery"""
    gcp_credentials_block = GcpCredentials.load("dez-gcp-creds")

    df.to_gbq(
        destination_table="trips_data_all.rides",
        project_id="sage-nucleus-376020",
        credentials=gcp_credentials_block.get_credentials_from_service_account(),
        chunksize=500_000,
        if_exists="append"
    )

@flow(log_prints=False)
def etl_gcs_to_bq(months: list[int] = [1, 2], year: int = 2021, color: str = "yellow"):
    """Main ETL flow to lad data into Big Query"""
    total_rows = 0
    for month in months:
        path = extract_from_gcs(color=color, year=year, month=month)
        df = pd.read_parquet(path)
        total_rows += len(df)
        write_bq(df)
    print(f"Total number of rows processed: {total_rows}.")

if __name__ == "__main__":
    color = "yellow"
    months = [2,3]
    year = 2019
    etl_gcs_to_bq(months, year, color)

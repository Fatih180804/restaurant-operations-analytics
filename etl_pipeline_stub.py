import pandas as pd
import mysql.connector

class RestaurantETLPipeline:
    """
    Handles Extracted Production Data from Excel and prepares clean loads for 
    the optimization models inside the data warehouse tables.
    """
    def __init__(self, file_path):
        self.file_path = file_path

    def run_analytics_ingestion(self):
        print("[ETL PROCESS INITIALIZED] Reading sales data matrices...")
        # Extract transactional data layers
        df_sales = pd.read_excel(self.file_path, sheet_name='Satislar')
        df_menu = pd.read_excel(self.file_path, sheet_name='Menu_Maliyet')
        
        print(f"-> Successfully extracted {len(df_sales)} transactional streams.")
        
        # Transformation Step: Data validation and alignment
        df_sales['toplam_tutar'] = df_sales['adet'] * df_sales['birim_fiyat']
        
        # Analytical Aggregation Pre-Load Simulation
        hourly_summary = df_sales.groupby(df_sales['saat'].str[:2])['toplam_tutar'].sum()
        print("\n[TRANSFORMATION SUCCESSFUL] Operational Hourly Sales Sample:")
        print(hourly_summary.head(3))

if __name__ == "__main__":
    pipeline = RestaurantETLPipeline(file_path="kafe_restoran_veriseti.xlsx")
    pipeline.run_analytics_ingestion()

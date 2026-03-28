import pandas as pd

FILE = "Alphawood Arboretum Inventory.ods"

print("Loading dataset...")
df = pd.read_excel(FILE, engine="odf", sheet_name="Arboretum_Live_Inventory")

print("Standardizing column names...")
df.columns = [c.strip().lower().replace(" ", "_") for c in df.columns]

print("Cleaning text columns...")
for col in ["common_name", "scientific_name", "condition_class", "age_class"]:
    if col in df.columns:
        df[col] = df[col].astype(str).str.strip().replace("nan", None)

print("Fixing GPS data...")
df["latitude"] = pd.to_numeric(df["latitude"], errors="coerce")
df["longitude"] = pd.to_numeric(df["longitude"], errors="coerce")

before = len(df)
df = df.dropna(subset=["latitude", "longitude"])
after = len(df)

print(f"Rows before GPS filter: {before}")
print(f"Rows after GPS filter: {after}")

df.to_csv("trees_clean.csv", index=False)

print("Done! Exported trees_clean.csv")

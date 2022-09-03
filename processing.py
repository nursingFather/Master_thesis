import pandas as pd
import numpy as np
from sklearn import preprocessing
from sklearn.preprocessing import StandardScaler, MinMaxScaler
import os

df8 = pd.read_excel(r"C:\Users\Olu\Desktop\Economic Policy\Data\Processed\daaat_2008.xlsx")
df15 = pd.read_excel(r"C:\Users\Olu\Desktop\Economic Policy\Data\Processed\full_2019nonull.xlsx")

# print(df8.head())
# print(df8.info())

report_folder = os.path.join(os.getcwd(), 'Repodata/')
if not os.path.exists(report_folder):
    os.makedirs(report_folder)

scaled_feat = df8.copy()
scaler = MinMaxScaler()
# convert hdi to Gdp to float so they wont be rescale
df8["HDI"] = df8["HDI"].astype('str')
df8["Gdp_per_capita"] = df8["Gdp_per_capita"].astype('str')

col_float = []
col_cat = []
for col in df8.columns:
    if df8[col].dtype == "float":
        col_float.append(col)
    elif df8[col].dtype != "float":
        col_cat.append(col)

# print(col_float)

features = scaled_feat[col_float]
scaler = MinMaxScaler(feature_range=(1, 100))
features = scaler.fit_transform(features.values)

scaled_feat[col] = features
# print(features)
scaled8 = pd.DataFrame(features, columns=col_float)

new_df8 = df8[col_cat].join(scaled8)
new_df8["HDI"] = df8["HDI"].astype('float')
new_df8["HDI"] = (df8["HDI"].astype('float'))
new_df8["Gdp_per_capita"] = df8["Gdp_per_capita"].astype('float')
scale_df8 = new_df8

# exporting data in excel format
scale_df8.to_excel(report_folder + "scale_df8.xlsx", index=False)
print(f"normal scaled 2008 table is :\n {scale_df8.head()}")

scale_df8["HDI"] = 100 * scale_df8["HDI"]
for col in scale_df8.columns:
    if scale_df8[col].dtype == "float":
        scale_df8[col] = np.log(scale_df8[col])
log_df8 = scale_df8
print(f"The log 2008 table is :\n {log_df8.head()}")

############################---------  --------------ää#####################
df15["HDI"] = df15["HDI"].astype('str')
df15["Gdp_per_capita"] = df15["Gdp_per_capita"].astype('str')
col_float = []
col_cat = []
for col in df15.columns:
    if df15[col].dtype == "float":
        col_float.append(col)
    elif df15[col].dtype != "float":
        col_cat.append(col)

# print(col_float)
features = scaled_feat[col_float]
scaler = MinMaxScaler(feature_range=(1, 100))
features = scaler.fit_transform(features.values)

scaled_feat[col] = features
# print(features)
scaled15 = pd.DataFrame(features, columns=col_float)

new_df15 = df15[col_cat].join(scaled15)
new_df15["HDI"] = df15["HDI"].astype('float')
new_df15["Gdp_per_capita"] = df15["Gdp_per_capita"].astype('float')
scaled_new_df15 = new_df15
print(f"normal scaled 2015 table is :\n {scaled_new_df15.head()}")

for col in scaled_new_df15.columns:
    if scaled_new_df15[col].dtype == "float":
        scaled_new_df15[col] = np.log(scaled_new_df15[col])
log_new_df15 = scaled_new_df15
print(f"log scaled 2015 table is :\n {log_new_df15.head()}")

scaled_new_df15.to_excel(report_folder + "scaled_new_df15.xlsx")
log_new_df15.to_excel(report_folder + "log_new_df15.xlsx")
log_df8.to_excel(report_folder + "log_df8.xlsx")









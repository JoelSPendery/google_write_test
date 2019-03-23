## test_process.R - called from Worker VM
library(googleAuthR)        ## authentication
library(DBI)                ## to write to mysql database

## authenticate on GCE for google cloud services
googleAuthR::gar_gce_auth()

my_data <- iris     # get iris data set

# write data to MySQL database
conn <- dbConnect(
  RMySQL::MySQL(),
  username = 'remoteuser',
  password = 'info123',
  host = '127.0.0.1',
  dbname = 'iris'
)

# write to table in Cloud SQL
dbWriteTable(conn, 'test_table', my_data)

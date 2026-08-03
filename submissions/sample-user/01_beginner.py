from pathlib import Path

import duckdb

con = duckdb.connect("training.duckdb")
con.execute(Path("../../00_setup.sql").read_text())

# --load employee list
con.sql(Path("sql/employee_list.sql").read_text()).show()

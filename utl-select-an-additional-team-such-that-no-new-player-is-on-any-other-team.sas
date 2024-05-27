%let pgm=utl-select-an-additional-team-such-that-no-new-player-is-on-any-other-team;

Select an additional team such that no new player is on any other team

This can also be easily solved with a format or a hash, however SQL is more universal.

        SOLUTIONS

           1 sas sql
           2 r sql (uses stattransfer to create sas dataset)
           3 python sql (uses stattransfer to create sas dataset)


github
https://tinyurl.com/33ucptk7
https://github.com/rogerjdeangelis/utl-select-an-additional-team-such-that-no-new-player-is-on-any-other-team

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                                      |                                |                                                */
/*         INPUT                        |       PROCESS                  |    OUTPUT                                      */
/*                                      |                                |                                                */
/*      CURRENT TEAMS                   |  proc datasets lib=work        |  TEAM     FRYS                                 */
/*      =============                   |    nodetails nolist;           |                                                */
/*                                      |   delete want;                 |  FRYS    Joyce                                 */
/*     TEAM      CURRENT                |  run;quit;                     |  FRYS    Judy                                  */
/*                                      |                                |  FRYS    Robert                                */
/*    COSCO      Alfred                 |  proc sql;                     |                                                */
/*    COSCO      Alice                  |    reset outobs=3;             |                                                */
/*    COSCO      Barbara                |    create                      |                                                */
/*                                      |      table want as             |                                                */
/*    TARGET     Carol                  |    select                      |                                                */
/*    TARGET     Henry                  |      team                      |                                                */
/*    TARGET     James                  |     ,frys                      |                                                */
/*                                      |    from                        |                                                */
/*    WALMART    Jane                   |      sd1.frys                  |                                                */
/*    WALMART    Janet                  |    where                       |                                                */
/*    WALMART    Jeffrey                |      frys not in (             |                                                */
/*                                      |        select                  |                                                */
/*    FRYS APPLICANTS                   |          current               |                                                */
/*    ===============                   |        from                    |                                                */
/*                                      |          sd1.current           |                                                */
/*     TEAM     FRYS                    |      )                         |                                                */
/*                                      |  ;quit;                        |                                                */
/*     FRYS    Alice                    |                                |                                                */
/*     FRYS    Joyce                    |                                |                                                */
/*     FRYS    Judy                     |                                |                                                */
/*     FRYS    Carol                    |                                |                                                */
/*     FRYS    Robert                   |                                |                                                */
/*     FRYS    Ronald                   |                                |                                                */
/*     FRYS    Jane                     |                                |                                                */
/*     FRYS    Philip                   |                                |                                                */
/*                                      |                                |                                                */
/*                                      |                                |                                                */
/*     libname sd1 "d:/sd1";            |                                |                                                */
/*     options validvarname=upcase;     |                                |                                                */
/*     data sd1.current;                |                                |                                                */
/*       input team$ current$;          |                                |                                                */
/*     cards4;                          |                                |                                                */
/*     COSCO Alfred                     |                                |                                                */
/*     COSCO Alice                      |                                |                                                */
/*     COSCO Barbara                    |                                |                                                */
/*     TARGET Carol                     |                                |                                                */
/*     TARGET Henry                     |                                |                                                */
/*     TARGET James                     |                                |                                                */
/*     WALMART Jane                     |                                |                                                */
/*     WALMART Janet                    |                                |                                                */
/*     WALMART Jeffrey                  |                                |                                                */
/*     ;;;;                             |                                |                                                */
/*     run;quit;                        |                                |                                                */
/*                                      |                                |                                                */
/*     data sd1.frys;                   |                                |                                                */
/*      input team$ frys$;              |                                |                                                */
/*     cards4;                          |                                |                                                */
/*     FRYS Alice                       |                                |                                                */
/*     FRYS Joyce                       |                                |                                                */
/*     FRYS Judy                        |                                |                                                */
/*     FRYS Carol                       |                                |                                                */
/*     FRYS Robert                      |                                |                                                */
/*     FRYS Ronald                      |                                |                                                */
/*     FRYS Jane                        |                                |                                                */
/*     FRYS Philip                      |                                |                                                */
/*     ;;;;                             |                                |                                                */
/*     run;quit;                        |                                |                                                */
/*                                      |                                |                                                */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

libname sd1 "d:/sd1";
options validvarname=upcase;
data sd1.current;
  input team$ current$;
cards4;
COSCO Alfred
COSCO Alice
COSCO Barbara
TARGET Carol
TARGET Henry
TARGET James
WALMART Jane
WALMART Janet
WALMART Jeffrey
;;;;
run;quit;

data sd1.frys;
 input team$ frys$;
cards4;
FRYS Alice
FRYS Joyce
FRYS Judy
FRYS Carol
FRYS Robert
FRYS Ronald
FRYS Jane
FRYS Philip
;;;;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*     SD1.CURRENT                                                                                                        */
/*                                                                                                                        */
/*     TEAM      CURRENT                                                                                                  */
/*                                                                                                                        */
/*    COSCO      Alfred                                                                                                   */
/*    COSCO      Alice                                                                                                    */
/*    COSCO      Barbara                                                                                                  */
/*                                                                                                                        */
/*    TARGET     Carol                                                                                                    */
/*    TARGET     Henry                                                                                                    */
/*    TARGET     James                                                                                                    */
/*                                                                                                                        */
/*    WALMART    Jane                                                                                                     */
/*    WALMART    Janet                                                                                                    */
/*    WALMART    Jeffrey                                                                                                  */
/*                                                                                                                        */
/*    SD1.FRYS                                                                                                            */
/*                                                                                                                        */
/*     TEAM     FRYS                                                                                                      */
/*                                                                                                                        */
/*     FRYS    Alice                                                                                                      */
/*     FRYS    Joyce                                                                                                      */
/*     FRYS    Judy                                                                                                       */
/*     FRYS    Carol                                                                                                      */
/*     FRYS    Robert                                                                                                     */
/*     FRYS    Ronald                                                                                                     */
/*     FRYS    Jane                                                                                                       */
/*     FRYS    Philip                                                                                                     */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*                             _
/ |  ___  __ _ ___   ___  __ _| |
| | / __|/ _` / __| / __|/ _` | |
| | \__ \ (_| \__ \ \__ \ (_| | |
|_| |___/\__,_|___/ |___/\__, |_|
                            |_|
*/

proc datasets lib=work
  nodetails nolist;
 delete want;
run;quit;

proc sql;
  reset outobs=3;
  create
    table want as
  select
    team
   ,frys
  from
    sd1.frys
  where
    frys not in (
      select
        current
      from
        sd1.current
    )
;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  WANT total obs=3                                                                                                      */
/*                                                                                                                        */
/* Obs    TEAM     FRYS                                                                                                   */
/*                                                                                                                        */
/*  1     FRYS    Joyce                                                                                                   */
/*  2     FRYS    Judy                                                                                                    */
/*  3     FRYS    Robert                                                                                                  */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___                     _
|___ \   _ __   ___  __ _| |
  __) | | `__| / __|/ _` | |
 / __/  | |    \__ \ (_| | |
|_____| |_|    |___/\__, |_|
                       |_|
*/


proc datasets lib=work
  nodetails nolist;
 delete want;
run;quit;

%utl_rbegin;
parmcards4;
library(haven)
library(sqldf)
source("c:/temp/fn_tosas9.R");
current<-read_sas("d:/sd1/current.sas7bdat")
frys<-read_sas("d:/sd1/frys.sas7bdat")
current;
frys;
want<-sqldf('
  select
    team
   ,frys
  from
    frys
  where
    frys not in (
      select
       current from current)
  limit 3
  ')
want
fn_tosas9(dataf=want)
;;;;
%utl_rend;

libname tmp "c:/temp";
proc print data=tmp.want;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* R                                                                                                                      */
/*                                                                                                                        */
/*   TEAM   FRYS                                                                                                          */
/* 1 FRYS  Joyce                                                                                                          */
/* 2 FRYS   Judy                                                                                                          */
/* 3 FRYS Robert                                                                                                          */
/*                                                                                                                        */
/* BACK TO SAS                                                                                                            */
/*                                                                                                                        */
/* Obs ROWNAMES    TEAM     FRYS                                                                                          */
/*                                                                                                                        */
/*  1      1       FRYS    Joyce                                                                                          */
/*  2      2       FRYS    Judy                                                                                           */
/*  3      3       FRYS    Robert                                                                                         */
/*                                                                                                                        */
/**************************************************************************************************************************/


/*____               _   _                             _
|___ /   _ __  _   _| |_| |__   ___  _ __    ___  __ _| |
  |_ \  | `_ \| | | | __| `_ \ / _ \| `_ \  / __|/ _` | |
 ___) | | |_) | |_| | |_| | | | (_) | | | | \__ \ (_| | |
|____/  | .__/ \__, |\__|_| |_|\___/|_| |_| |___/\__, |_|
        |_|    |___/                                |_|
*/


proc datasets lib=work
  nodetails nolist;
 delete want;
run;quit;

%utl_pybegin;
parmcards4;
import os
import sys
import subprocess
import time
from os import path
import pandas as pd
import numpy as np
import pyreadstat as ps
from pandasql import sqldf
mysql = lambda q: sqldf(q, globals())
from pandasql import PandaSQL
pdsql = PandaSQL(persist=True)
sqlite3conn = next(pdsql.conn.gen).connection.connection
sqlite3conn.enable_load_extension(True)
sqlite3conn.load_extension('c:/temp/libsqlitefunctions.dll')
mysql = lambda q: sqldf(q, globals())
current,meta=ps.read_sas7bdat \
("d:/sd1/current.sas7bdat")
frys,meta=ps.read_sas7bdat \
("d:/sd1/frys.sas7bdat")
want = pdsql('''
  select
    team
   ,frys
  from
    frys
  where
    frys not in (
      select
       current from current)
  limit 3
''')
print(want)
exec(open('c:/temp/fn_tosas9.py').read())
fn_tosas9(
   want
   ,dfstr="want"
   ,timeest=3
   )
;;;;
%utl_pyend;

libname tmp "c:/temp";
proc print data=tmp.want;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* Python                                                                                                                 */
/*                                                                                                                        */
/*    TEAM    FRYS                                                                                                        */
/* 0  FRYS   Joyce                                                                                                        */
/* 1  FRYS    Judy                                                                                                        */
/* 2  FRYS  Robert                                                                                                        */
/*                                                                                                                        */
/* BACK TO SAS                                                                                                            */
/*                                                                                                                        */
/* Obs    TEAM     FRYS                                                                                                   */
/*                                                                                                                        */
/*  1     FRYS    Joyce                                                                                                   */
/*  2     FRYS    Judy                                                                                                    */
/*  3     FRYS    Robert                                                                                                  */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

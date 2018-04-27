from faker import Factory
from array import array
import csv
import random

fake = Factory.create() #initialize faker module
genders = [] #ensure constraint satisfaction for player.gender attribute
genders.append('M')
genders.append('F')

leagueGenders = [] #ensure constraint satisfaction for league.gender attribute
leagueGenders.append('M')
leagueGenders.append('F')
leagueGenders.append('B')

# variables that define amount of data created for each table. Some tables must have equal size (eg. Player and Stats)
playersize = 20000
teamsize = 3000
leaguesize = 200
coachsize = 100
gamesize = 3000


def createData(fake): #function to write all data to separate csv files for each table
  """"""
#PLAYER DATA 20,000 entries---------------------------------------
  #unique set of player names
  pname = set()
  #open and write to csv file
  with open('playerFake.csv', 'w') as file:
    writer = csv.writer(file)
    for i in range(playersize):
      name = fake.name()
      file.write(name + ',' + str(fake.random_digit_not_null()) + ',' + fake.random_element(genders) + ',' + fake.word() + ',' + str(fake.random_digit_not_null()) + ',' + fake.city() + '\n')

      #add name to pname set for later use in relation data generation
      pname.add(name)



#STATS DATA 20,000 entries-----------------------------------------
  with open('statsFake.csv', 'w') as file:
    writer = csv.writer(file)
    for i in range(playersize):
      file.write(str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + '\n')



#TEAM DATA 3000 entries---------------------------------------------
  tname = list()
  league = set()
  with open('teamFake.csv', 'w') as file:
    writer = csv.writer(file)
    for i in range(teamsize):
      temptname = fake.word()
      templeague = fake.word()
      file.write(temptname + ',' + templeague + ',' + fake.city() + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + '\n')
      tname.add(temptname)
      league.add(templeague)



#LEAGUE DATA 200 entries------------------------------------------
  lname = set()
  with open('leagueFake.csv', 'w') as file:
    writer = csv.writer(file)
    for i in range(leaguesize):
      templname = fake.word()
      file.write(templname + ',' + fake.word() + ',' + fake.random_element(leagueGenders) + '\n')
      lname.add(templname)



#COACH DATA 100 entries-------------------------------------------
  cname = set()
  with open('coachFake.csv', 'w') as file:
    writer = csv.writer(file)
    for i in range(coachsize):
      tempcname = fake.name()
      file.write(tempcname + ',' + fake.numerify(text="##########") + ',' +  str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + '\n')
      cname.add(tempcname)



#GAME DATA 3000 entries------------------------------------------
  location = set()
  starttime = set()
  with open('gameFake.csv', 'w') as file:
    writer = csv.writer(file)
    for i in range(gamesize):
      templocation = fake.word()
      tempstarttime = str(fake.date_time_ad())
      file.write(templocation + ',' + tempstarttime + ',' + fake.word() + ',' + str(fake.random_digit_not_null()) + '-' + str(fake.random_digit_not_null()) + '\n')
      location.add(templocation)
      starttime.add(tempstarttime)



#PLAYSFOR DATA---------------------------------------
  with open('playsForFake.csv', 'w') as file:
    writer = csv.writer(file)
    for item in pname:
      file.write(item + ',' + random.sample(tname, 1)[0] + ',' + random.sample(league, 1)[0] + '\n')



#RECORDS DATA----------------------------------------
  with open('recordsFake.csv', 'w') as file:
    writer = csv.writer(file)
    for item in pname:
      file.write(item + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.    random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + '\n')



#PARTICIPATES DATA------------------------------------
  with open('participatesFake.csv', 'w') as file:
    writer = csv.writer(file)
    for item in pname:
      file.write(item + ',' + random.sample(location, 1)[0] + ',' + random.sample(starttime, 1)[0] + '\n')



#COMPETESIN DATA--------------------------------------
  with open('competesInFake.csv', 'w') as file:
    writer = csv.writer(file)
    for item in tname:
      file.write(item + ',' + random.sample(league, 1)[0] + ',' + random.sample(location, 1)[0] + ',' + random.sample(starttime, 1)[0] + '\n')



#ORGANIZES DATA---------------------------------------
  with open('organizesFake.csv', 'w') as file:
    writer = csv.writer(file)
    for item in tname:
      file.write(item + ',' + random.sample(league, 1)[0] + ',' + random.sample(lname, 1)[0] + '\n')



#TRAINS DATA------------------------------------------
  with open('trainsFake.csv', 'w') as file:
    writer = csv.writer(file)
    for item in tname:
      file.write(random.sample(cname, 1)[0] + ',' + item + ',' + random.sample(league, 1)[0] + '\n')



#INCREMENTS DATA---------------------------------------
  with open('incrementsFake.csv', 'w') as file:
    writer = csv.writer(file)
    for item in location:
      file.write(item + ',' + random.sample(starttime, 1)[0] + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.    random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + ',' + str(fake.random_digit_not_null()) + '\n')





if __name__ == "__main__":
  fake = Factory.create()
  createData(fake)

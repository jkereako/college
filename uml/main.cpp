/************************************/
/* Programmer: Jeffrey Kereakoglow	*/
/* File: main.cpp					          */
/*									                */
/* Date: Dec 14, 2007  				      */
/************************************/

#include <iostream>
#include <string>
#include <cctype>
#include "UniversityDatabase.h"

#define size_t selection;

selection databaseOptions();
void databaseDeletion();
void recordPrint();
selection personClassOptions();
selection employeeFunctionOptions();
selection studentClassification();
selection supportDivision();
selection academicBureau();
selection administrationPositions();
selection facultyDivision();
selection instructorTitle();

selection databaseOptions()
{

  selection userSelection;

  cout << " Would you like to:\n"
       << " 1) Add a person to the database"
       << " 2) Delete a person from the database"
       << " 3) Print a record from the database"
       << " 4) Print the database in its entirety" << endl;

  cin >> userSelection;

  return userSelection
}

void databaseDeletion()
{

  //The string can, and will read in either a name or an ID
  string nameOrID;

  cout << " Enter the name or ID number of the person you would like to delete."
       << endl;

  cin >> nameOrID;

  // Correctly recast the string to a size_t if user input is a number
  if (isdigit(nameOrID[1]))
    nameOrID = static_cast<size_t> nameOrID;

  deletePerson(nameOrID);
}

void recordPrint()
{

  string nameOrID;

  cout << " Enter the name or ID number of the person you would like to see." << endl;

  cin >> nameOrID;

  if (isdigit(nameOrID[1]))
    nameOrID = static_case<size_t> nameOrID;

  printPerson(nameOrID);
}

selection personClassOptions()
{

  selection userSelection;

  cout << " Classification of person:\n"
       << " 1) Employee"
       << " 2) Student"
       << " 3) Alumnus" << endl;
  cin >> userSelection;

  return userSelection
}

selection employeeFunctionOptions()
{

  selection userSelection;

  cout << " Employee's Function:\n"
       << " 1) Academic employee"
       << " 2) Hourly employee"
       << " 3) Support employee" << endl;
  cin >> userSelection;

  return userSelection
}

selection studentClassification()
{

  selection userSelection;

  cout << " Student's Calssification:\n"
       << " 1) Freshman"
       << " 2) Sophomore"
       << " 3) Junior"
       << " 4) Senior"
       << " 5) Graduate" << endl;

  cin >> userSelection;

  return userSelection
}

selection supportDivision()
{

  selection userSelection;

  cout << " Support Employee Division:\n"
       << " 1) Administrative"
       << " 5) Custodial" << endl;

  cin >> userSelection;

  return userSelection
}

selection academicBureau()
{

  selection userSelection;

  cout << " Academic Bureau:\n"
       << " 1) Administration"
       << " 2) Faculty"
       << endl;

  cin >> userSelection;

  return userSelection
}

selection administrationPositions()
{

  selection userSelection;

  cout << " Administration's Positions:\n"
       << " 1) Chancellor"
       << " 2) Provost"
       << " 3) Dean"
       << " 4) Chair" << endl;

  cin >> userSelection;

  return userSelection
}

selection facultyDivision()
{

  selection userSelection;

  cout << " Faculty Division:\n"
       << " 1) Teaching"
       << " 4) Research" << endl;

  cin >> userSelection;

  return userSelection
}

selection instructorTitle()
{

  selection userSelection;

  cout << " Instructor's Title:\n"
       << " 1) Instructor"
       << " 2) Assistant professor"
          " 3) Associate professor"
          " 4) Professor"
          " 5) Professor emeritus"
       << endl;

  cin >> userSelection;

  return userSelection
}

int main(int argc, char **argv)
{

  cout << "Wlecome to my program bitches" << endl;

  //databaseOptions();
  //personClassOptions();
  //employeeFunctionOptions();
  //studentClassification();
  //supportDivision();
  //academicBureau();
  //administrationPositions();
  //facultyDivision();
  //instructorTitle();

  return 0;
}

/************************************/
/* Programmer: Jeffrey Kereakoglow	*/
/* File: UniversityDatabase.h		    */
/*									                */
/* Date: Dec 12, 2007				        */
/************************************/

#ifndef UNIVERSITYDATABASE_H_
#define UNIVERSITYDATABASE_H_

#include "UniversityPerson.h"
#include <map>
#include <string>

class UniversityDatabase
{
public:
  UniversityDatabase();
  virtual ~UniversityDatabase();

public:
  void createNewPerson(UniversityPerson *newPerson, size_t id, std::string name);
  void deletePerson(size_t id, std::string name);
  void printPerson(std::string name);
  void printPerson(size_t id);
  void printDatabase();

private:
  std::map<std::size_t, UniversityPerson *> idMap;
  std::map<std::string, UniversityPerson *> nameMap;
};

#endif /*UNIVERSITYDATABASE_H_*/

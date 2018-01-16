/************************************/
/* Programmer: Jeffrey Kereakoglow	*/
/* File: UniversityDatabase.cpp		  */
/*									                */
/* Date: Dec 13, 2007				        */
/************************************/

#include "UniversityDatabase.h"

using namespace std;

UniversityDatabase::UniversityDatabase()
{
}

UniversityDatabase::~UniversityDatabase()
{
}

void UniversityDatabase::createNewPerson(UniversityPerson *newPerson, size_t id, string name)
{
  pair<map<size_t, UniversityPerson *>::iterator, bool> idPair;
  pair<map<string, UniversityPerson *>::iterator, bool> namePair;

  //make_pair() returns an iterator to the element, and bool if the entry already exists
  idPair = idMap.insert(make_pair(id, newPerson));
  namePair = nameMap.inster(make_pair(name, newPerson));

  if (idPair.second() == false || namePair.second == false)
    cerr << "Entry already exists";
}

void UniversityDatabase::deletePerson(string name)
{

  map<string, UniversityPerson *>::iterator nameIter = nameMap.find(name);
  //map<size_t, UniversityPerson*>::iterator idIter = idMap.find(id);

  if (nameMap.erase(nameIter) == 0)
    cerr << "The entry " << name << " is not in the database";
}

void UniversityDatabase::deletePerson(size_t id)
{

  //map<string, UniversityPerson*>::iterator nameIter = nameMap.find(name);
  map<size_t, UniversityPerson *>::iterator idIter = idMap.find(id);

  if (idMap.erase(idIter) == 0)
    cerr << "The entry " << id << " is not in the database";
}

void UniversityDatabase::printPerson(std::string name)
{

  return nameMap.find(name);
}
void UniversityDatabase::printPerson(size_t id)
{
  return idMap.find(id);
}

void UniversityDatabase::printDatabase();
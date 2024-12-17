| Table / Actions | SELECT | INSERT | UPDATE | DELETE |
| --- | --- | --- | --- | --- |
| 1. PERSONS | Personas del mismo club que el target | Del mismo club y de mayor jerarquía que el target | Del mismo club y de mayor jerarquía que el target o el target mismo | Nadie |
| 2. CLUBS | Todos los autenticados | Nadie | Del mismo club y STAFF | Nadie |
| 3. SOCIALS | Todos los autenticados | Nadie | Nadie | Nadie |
| 4. CLUB_SOCIALS | Todos los autenticados | Del mismo club y STAFF | Del mismo club y STAFF | Del mismo club y STAFF |
| 5. ROLES | Todos los autenticados | Nadie | Nadie | Nadie |
| 6. UNITS | Personas del mismo club que la unidad | Del mismo club. STAFF o COUNSELOR. | Del mismo club y STAFF. Del mismo club, miembro de la unidad Y COUNSELOR. | Nadie |
| 7.  CLASSES | Todos los autenticados | Nadie | Nadie | Nadie |
| 8. CLASS_ITEMS | Todos los autenticados | Nadie | Nadie | Nadie |
| 9. PERSON_CLASS_ITEMS | Todos los que pertenecen al mismo club que la persona | Del mismo club. Rol de mayor jerarquía que el target o staff que no sea el mismo. | No hace falta | Del mismo club. Rol de mayor jerarquía que el target o staff que no sea el mismo. |
| 10. PATHFINDER_UNITS | Todos los que pertenecen al mismo club que la persona |  Rol STAFF y del mismo club que la unidad y que persona target. Rol COUNSELOR, de la misma unidad target y del mismo club de la persona target. | No hace falta | Rol STAFF y del mismo club que la unidad y que persona target. Rol COUNSELOR, de la misma unidad target y del mismo club de la persona target. |
| 11. COUNSELOR_UNITS | Todos los que pertenecen al mismo club que la persona | Rol STAFF y del mismo club que la unidad y que persona target. Rol COUNSELOR, que sea el mismo target. | No hace falta | Rol STAFF y del mismo club que la unidad y que persona target. Rol COUNSELOR, que sea el mismo target. |
| 12. STAFF_UNITS | Todos los que pertenecen al mismo club que la persona | Rol STAFF y del mismo club que la unidad y que persona target. | No hace falta | Rol STAFF y del mismo club que la unidad y que persona target. |
| 13. PERSON_CLASSES | Todos los que pertenecen al mismo club que la persona | Del mismo club y de mayor jerarquía que la persona target o rol STAFF | Del mismo club y de mayor jerarquía que la persona target o rol STAFF | Del mismo club y de mayor jerarquía que la persona target o rol STAFF |
| 14. HONOR | Todos los autenticados | Nadie | Nadie | Nadie |
| 15. HONOR_CATEGORY | Todos los autenticados | Nadie | Nadie | Nadie |
| 16. PERSON_HONOR | Todos los que pertenecen al mismo club que la persona | Del mismo club. Rol de mayor jerarquía que el target o staff que no sea el mismo. | No hace falta | Del mismo club. Rol de mayor jerarquía que el target o staff que no sea el mismo. |
| 17. EVENT | Todos los que pertenecen al mismo club del evento | Rol STAFF del mismo club que el evento | Rol STAFF del mismo club que el evento | Rol STAFF del mismo club que el evento |
| 18. ATTENDANCE | Todos los que pertenecen al mismo club  | Pertenecen al mismo club que el evento y la persona. STAFF o COUNSELOR perteneciente a la misma unidad que la persona target. | No hace falta | Pertenecen al mismo club que el evento y la persona. STAFF o COUNSELOR perteneciente a la misma unidad que la persona target. |

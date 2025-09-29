using {
  cuid,
  managed
} from '@sap/cds/common';

namespace alfa.cockpit;

entity Users : cuid, managed {
  name            : String(100);
  email           : String(150);
  status          : String(20);

  navRoleCollections : Composition of many UserRoleCollections
                      on navRoleCollections.user = $self;
}

entity RoleCollections : cuid, managed {
  name        : String(100);
  description : String(255);

  navUsers       : Composition of many UserRoleCollections
                  on navUsers.roleCollection = $self;

  navRoles       : Composition of many RoleCollectionRoles
                  on navRoles.roleCollection = $self;
}

entity Roles : cuid, managed {
  name            : String(100);
  description     : String(255);

  navRoleCollections : Composition of many RoleCollectionRoles
                      on navRoleCollections.role = $self;
}

entity UserRoleCollections : cuid, managed {
  user           : Association to Users;
  roleCollection : Association to RoleCollections;
}

entity RoleCollectionRoles : cuid, managed {
  roleCollection : Association to RoleCollections;
  role           : Association to Roles;
}

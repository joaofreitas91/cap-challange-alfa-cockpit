using alfa.cockpit as cockpit from '../db/schema';

service CatalogService {
    entity Users           as projection on cockpit.Users;
    entity Roles           as projection on cockpit.Roles;
    entity RoleCollections as projection on cockpit.RoleCollections;

    entity UserRoleCollections as projection on cockpit.UserRoleCollections;
    entity RoleCollectionRoles as projection on cockpit.RoleCollectionRoles;
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HUNM - Consumption'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_C_HUNM_MASTER
  provider contract transactional_query
  as projection on Z_R_HUNM_MASTER
{
      @ObjectModel.text.element: ['EmployeeName']
  key EmployeeNumber,
      EmployeeName,
      EmployeeDepartment,
      EmployeeStatus,
      JobTitle,
      StartDate,
      EndDate,
      Email,
      @ObjectModel.text.element: ['ManagerName']
      ManagerNumber,
      ManagerName,
      ManagerDepartment,
      CreatedOn,
      @Semantics.user.createdBy: true
      CreatedBy,
      ChangedOn,
      @Semantics.user.lastChangedBy: true      
      ChangedBy
}

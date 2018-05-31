pragma solidity 0.4.24;

contract Market {
    
    struct Vehicle {
        uint vid;
        address owner;
        string model;
        string regNo;
        uint noOfMaintenance;
        uint[] maintenanceRecordsList;
        uint[] insuranceDetailsList;

    }
    
    struct RepairShop {
        uint rsid;
        string name;
        string owner;
        string contactNo;
        string shopAdress;
    }
    
    struct InsuranceCompany {
        uint icid;
        string name;
        string contactNo;
    
    }
    
    struct MaintenanceRecord {
        uint mid;
        uint vid;
        uint rsid;
        // string date;
        // string time;
        // string fee;
        string description;
        // string[] sparePartsIds;
        // int rating;
    }
    
    
    struct InsuranceRecord {
        uint irid;
        uint companyId;
        string date;
        uint vid;
        string policy;
        
    }

    mapping (uint => Vehicle) vehicles;
    uint[] public vehicleList;
    
    mapping (uint => RepairShop) repairShops;
    uint[] public repairShopsList;
    
    mapping (uint => InsuranceCompany) insuranceCompanies;
    uint[] public insuranceCompaniesList;
    
    mapping (uint => MaintenanceRecord) maintenanceRecords;
    mapping (uint => InsuranceRecord) insuranceRecords;
    
    function addVehicle(uint _vid, string _model, string _regNo) public {
        var vehicle = vehicles[_vid];
        vehicle.vid = _vid;
        vehicle.owner = msg.sender;
        vehicle.model = _model;
        vehicle.regNo = _regNo;
        vehicleList.push(_vid);
    }
    
    function addRepairShop(uint _rsid, string _name, string _owner, string _contactNo,string _shopAdress) public {
        var repairShop = repairShops[_rsid];
        repairShop.rsid = _rsid;
        repairShop.name = _name;
        repairShop.owner = _owner;
        repairShop.contactNo = _contactNo;
        repairShop.shopAdress = _shopAdress;
        repairShopsList.push(_rsid);
    }
    
    function addInsuranceCompany(uint _icid, string _name, string _contactNo) public {
        var insuranceCompany = insuranceCompanies[_icid];
        insuranceCompany.icid = _icid;
        insuranceCompany.name = _name;
        insuranceCompany.contactNo = _contactNo;
        insuranceCompaniesList.push(_icid);
        
    }
    
    function addMaintenanceRecord(uint _vid, uint _mid, uint _rsid, string _description) public {
        var maintenanceRecord = maintenanceRecords[_mid];
        maintenanceRecord.vid = _vid;
        maintenanceRecord.rsid = _rsid;
        maintenanceRecord.description = _description;
        vehicles[_vid].noOfMaintenance += 1;
        vehicles[_vid].maintenanceRecordsList.push(_mid);
    }
    
    function getVehicle(uint _vid) view public returns(address, string, string) {
        return(vehicles[_vid].owner,vehicles[_vid].model, vehicles[_vid].regNo);
    }
    
    function getVehicleMaintenance(uint _vid) view public returns(uint) {
        return(vehicles[_vid].noOfMaintenance);
    }
    
    
    function getRepairshop(uint _rsid) view public returns(string, string, string, string) {
        return(repairShops[_rsid].name,repairShops[_rsid].owner, repairShops[_rsid].contactNo, repairShops[_rsid].shopAdress);
    }
    
    function getInsuranceCompany(uint _icid) view public returns(string, string) {
        return(insuranceCompanies[_icid].name,insuranceCompanies[_icid].contactNo);
    }
    
    function getOwner(uint _vid) view public returns(address) {
        return (vehicles[_vid].owner);
    }
    
    function changeOwner(uint _vid, address newOwner) public {
        if(msg.sender == vehicles[_vid].owner) {
            vehicles[_vid].owner = newOwner;
        }
    }
    
}

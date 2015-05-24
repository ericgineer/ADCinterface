#Select the master service type and check for available service paths.
set service_paths [get_service_paths master]
#Set the master service path.
set master_service_path [lindex $service_paths 0]
#Open the master service.
set claim_path [claim_service master $master_service_path mylib]

#set LED values
master_write_8 $claim_path 0x0 0xff
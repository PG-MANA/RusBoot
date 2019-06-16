pub mod table;
pub mod text;

//use
use self::table::EfiTableManager;
use self::text::output::EfiTextOutputManager;

pub struct EfiManager {
    pub is_valid: bool,
    pub table_manager: EfiTableManager,
    pub output_manager: EfiTextOutputManager,
}

impl EfiManager {
    pub fn new(address: usize) -> EfiManager {
        let table_manager = EfiTableManager::new(address);
        let output_manager =
            EfiTextOutputManager::new(table_manager.get_efi_systemtable().console_output_protocol);
        output_manager.output("Hello,world!");
        EfiManager {
            is_valid: true,
            table_manager: table_manager,
            output_manager: output_manager,
        }
    }
}

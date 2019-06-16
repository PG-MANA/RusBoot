#![no_std]
#![no_main]
#![feature(asm)]
#![feature(core_panic_info)]

//module
mod efi;

//use
use core::panic;
use efi::table::{EfiHandle, EfiStatus};
use efi::EfiManager;

#[no_mangle]
pub extern "C" fn efi_main(_efi_handle: EfiHandle, efi_system_table: usize) -> EfiStatus {
    let efi_manager = EfiManager::new(efi_system_table);
    efi_manager.output_manager.reset(false);
    efi_manager.output_manager.output("Hello, UEFI!");
    loop {
        unsafe {
            asm!("hlt");
        }
    }
}

#[panic_handler]
#[no_mangle]
pub fn panic(_info: &panic::PanicInfo) -> ! {
    loop {
        unsafe {
            asm!("hlt");
        }
    }
}

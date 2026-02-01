#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use std::process::{Command, Child};
use std::sync::Mutex;

static NODE_PROCESS: Mutex<Option<Child>> = Mutex::new(None);

fn main() {
  tauri::Builder::default()
    .setup(|_app| {
      let child = Command::new("node")
        .arg("server.js")
        .spawn()
        .expect("Failed to start Next.js server");

      *NODE_PROCESS.lock().unwrap() = Some(child);
      Ok(())
    })
    .run(tauri::generate_context!())
    .expect("error while running tauri application");
}

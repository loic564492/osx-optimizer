#!/bin/bash

# MacOS Virtualization Optimization Script with Functions

# 1. Disable Spotlight indexing to improve performance in virtualized environments
disable_spotlight() {
    echo "Disabling Spotlight indexing..."
    sudo mdutil -i off -a
}

# 2. Enable performance mode (for server applications)
enable_performance_mode() {
    echo "Enabling performance mode..."
    sudo nvram boot-args="serverperfmode=1 $(nvram boot-args 2>/dev/null | cut -f 2-)"
}

# 3. Disable heavy login screen wallpaper
disable_login_wallpaper() {
    echo "Disabling login screen wallpaper..."
    sudo defaults write /Library/Preferences/com.apple.loginwindow DesktopPicture ""
}

# 4. Reduce Motion and Transparency for better performance
reduce_motion_transparency() {
    echo "Reducing motion and transparency effects..."
    defaults write com.apple.Accessibility DifferentiateWithoutColor -int 1
    defaults write com.apple.Accessibility ReduceMotionEnabled -int 1
    defaults write com.apple.universalaccess reduceMotion -int 1
    defaults write com.apple.universalaccess reduceTransparency -int 1
}

# 5. Enable multi-sessions (useful in some server environments)
enable_multi_sessions() {
    echo "Enabling multi-sessions..."
    sudo /usr/bin/defaults write .GlobalPreferences MultipleSessionsEnabled -bool TRUE
    defaults write "Apple Global Domain" MultipleSessionsEnabled -bool true
}

# 6. Disable automatic macOS updates (use with caution, only if you are sure)
disable_auto_updates() {
    echo "Disabling automatic updates..."
    sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool false
    defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false
    defaults write com.apple.commerce AutoUpdate -bool false
    defaults write com.apple.commerce AutoUpdateRestartRequired -bool false
    defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 0
    defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 0
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 0
    defaults write com.apple.SoftwareUpdate AutomaticDownload -int 0
}

# 7. Disable screen locking for better automation and performance
disable_screen_locking() {
    echo "Disabling screen locking..."
    defaults write com.apple.loginwindow DisableScreenLock -bool true
}

# 8. Show a lighter username/password prompt (no user list)
show_username_password_prompt() {
    echo "Configuring login window to show username/password fields only..."
    defaults write /Library/Preferences/com.apple.loginwindow.plist SHOWFULLNAME -bool true
    defaults write com.apple.loginwindow AllowList -string '*'
}

# 9. Disable saving the application state on shutdown
disable_save_state_on_shutdown() {
    echo "Disabling application state saving on shutdown..."
    defaults write com.apple.loginwindow TALLogoutSavesState -bool false
}

# Main function to call all optimizations
main() {
    echo "Starting macOS optimization process..."
    
    # Call individual functions
    disable_spotlight
    enable_performance_mode
    disable_login_wallpaper
    reduce_motion_transparency
    enable_multi_sessions
    disable_auto_updates
    disable_screen_locking
    show_username_password_prompt
    disable_save_state_on_shutdown

    echo "Optimization complete! Please restart your system for changes to take effect."
}

# Run the main function
main

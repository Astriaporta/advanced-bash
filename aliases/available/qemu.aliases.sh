[[ type "qemu" &> /dev/null; ]] && return

alias qvm="qemu-system-x86_64 -cpu host -m 4G -boot d -enable-kvm -smp 3 -net nic -net user -no-acpi -hda"

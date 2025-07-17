#
# {{{ CDDL HEADER
#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
# }}}
#
# Copyright 2025 Jalil HESSANE
#

#
# XOR main Makefile
#

include xor.conf

.PHONY:   self_signed_certs components boot_archive boot_env recovery clean 

self_signed_certs:
	@echo "Self signed certs"
	@$(XOR_DIR)/tools/self_signed_certs

components: self_signed_certs
	@echo "Components"
	@$(XOR_DIR)/tools/components

boot_archive: 
	@echo "Boot Archive"
	@$(XOR_DIR)/tools/boot_archive

boot_env: boot_archive
	@echo "Boot Environment"
	@$(XOR_DIR)/tools/boot_env

recovery: boot_env
	@echo "Recovery ISO"
	@$(XOR_DIR)/tools/recovery
	@echo "ISO created: $(ISO_NAME)"

clean:
	@echo "=== Cleaning up ==="
	@rm -rf /tmp/xor.*
	@rm -f "$(ISO_NAME)"
	@echo "Clean complete"





onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib mem_v2c_sign_opt

do {wave.do}

view wave
view structure
view signals

do {mem_v2c_sign.udo}

run -all

quit -force

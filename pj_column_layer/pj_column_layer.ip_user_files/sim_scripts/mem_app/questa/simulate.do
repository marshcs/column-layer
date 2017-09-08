onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib mem_app_opt

do {wave.do}

view wave
view structure
view signals

do {mem_app.udo}

run -all

quit -force

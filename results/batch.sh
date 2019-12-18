# gem5 Directory
gem5_dir=~/gem5  # Directory of gem5 installation
benchmarks_dir=$gem5_dir/spec_cpu2006  # Directory of Benchmarks
cpu_types=(MinorCPU)
benchmarks_output=$gem5_dir/Benchmarks_results

l1_data_size=(32kB 16kB 128kB 64kB ) # l1_data_size + l_instruction_size < 256kB
l1_instruction_size=(64kB 16kB 32kB 128kB)
l2_size=(512kB 256kB 1MB 2MB 4MB) # less than 4MB
l1_instruction_assoc=(1 2 4)
l1_data_assoc=(1 2 4)
l2_data_assoc=(2 1 4)
cacheline_size=(64 32 128)
cpu_clock=(1GHz)
instructions_num=100000000

benchmarks_makefiles=($(find $benchmarks_dir/ -iname Makefile))
#execute Makefiles
#for makefile in ${benchmarks_makefiles[*]}
#do
#    make -C $(dirname $makefile)/
#done

declare -A benchmarks_executable
#benchmarks_executable[spec_cpu2006/401.bzip2/src/specbzip]="-o spec_cpu2006/401.bzip2/data/input.program 10"
benchmarks_executable[spec_cpu2006/429.mcf/src/specmcf]="-o spec_cpu2006/429.mcf/data/inp.in"
benchmarks_executable[spec_cpu2006/456.hmmer/src/spechmmer]="-o --fixed 0 --mean 325 --num 45000 --sd 200 --seed 0 spec_cpu2006/456.hmmer/data/bombesin.hmm"
benchmarks_executable[spec_cpu2006/458.sjeng/src/specsjeng]="-o spec_cpu2006/458.sjeng/data/test.txt"
benchmarks_executable[spec_cpu2006/470.lbm/src/speclibm]="-o 20spec_cpu2006/470.lbm/data/lbm.in 0 1spec_cpu2006/470.lbm/data/100_100_130_cf_a.of"
benchmarks_name=(specmcf spechmmer specsjeng speclibm)
# -------------- l1 size benchmarks
i=0;
for bench in "${!benchmarks_executable[@]}"; do
  dirout="${benchmarks_name[$i]}"  #
  ((i+=1))
  for l1_data in ${l1_data_size[*]}; do
    for l1_instruction in ${l1_instruction_size[*]}; do
      $gem5_dir/build/ARM/gem5.opt -d ${benchmarks_output}/${dirout}/l1d.${l1_data}_l1i.${l1_instruction} $gem5_dir/configs/example/se.py --cpu-type=${cpu_types[0]} --caches --l2cache --l1d_size=$l1_data --l1i_size=$l1_instruction --l2_size=${l2_size[0]} --l1i_assoc=${l1_instruction_assoc[0]} --l1d_assoc=${l1_data_assoc[0]} --l2_assoc=${l2_data_assoc[0]} --cacheline_size=${cacheline_size[0]} --cpu-clock=${cpu_clock[0]} -c $bench "${benchmarks_executable[$bench]}" -I $instructions_num
    done
  done
done
# -------------- l2_size benchmarks
i=0;
for bench in "${!benchmarks_executable[@]}"; do
  dirout="${benchmarks_name[$i]}"  #
  ((i+=1))
  for l2 in ${l2_size[*]}; do
      $gem5_dir/build/ARM/gem5.opt -d ${benchmarks_output}/${dirout}/l2_size.${l2} $gem5_dir/configs/example/se.py --cpu-type=${cpu_types[0]} --caches --l2cache --l1d_size=${l1_data_size[0]} --l1i_size=${l1_instruction_size[0]} --l2_size=$l2 --l1i_assoc=${l1_instruction_assoc[0]} --l1d_assoc=${l1_data_assoc[0]} --l2_assoc=${l2_data_assoc[0]} --cacheline_size=${cacheline_size[0]} --cpu-clock=${cpu_clock[0]} -c $bench "${benchmarks_executable[$bench]}" -I $instructions_num
  done
done
# -------------- l1_instruction_assoc benchmarks
i=0;
for bench in "${!benchmarks_executable[@]}"; do
  dirout="${benchmarks_name[$i]}"  #
  ((i+=1))
  for l1i in ${l1_instruction_assoc[*]}; do
      $gem5_dir/build/ARM/gem5.opt -d ${benchmarks_output}/${dirout}/l1i_assoc.${l1i} $gem5_dir/configs/example/se.py --cpu-type=${cpu_types[0]} --caches --l2cache --l1d_size=${l1_data_size[0]} --l1i_size=${l1_instruction_size[0]} --l2_size=${l2_size[0]} --l1i_assoc=$l1i --l1d_assoc=${l1_data_assoc[0]} --l2_assoc=${l2_data_assoc[0]} --cacheline_size=${cacheline_size[0]} --cpu-clock=${cpu_clock[0]} -c $bench "${benchmarks_executable[$bench]}" -I $instructions_num
  done
done
# -------------- l1_data_assoc benchmarks
i=0;
for bench in "${!benchmarks_executable[@]}"; do
  dirout="${benchmarks_name[$i]}"  #
  ((i+=1))
  for l1d in ${l1_data_assoc[*]}; do
      $gem5_dir/build/ARM/gem5.opt -d ${benchmarks_output}/${dirout}/l1d_assoc.${l1d} $gem5_dir/configs/example/se.py --cpu-type=${cpu_types[0]} --caches --l2cache --l1d_size=${l1_data_size[0]} --l1i_size=${l1_instruction_size[0]} --l2_size=${l2_size[0]} --l1i_assoc=${l1_instruction_assoc[0]} --l1d_assoc=$l1d --l2_assoc=${l2_data_assoc[0]} --cacheline_size=${cacheline_size[0]} --cpu-clock=${cpu_clock[0]} -c $bench "${benchmarks_executable[$bench]}" -I $instructions_num
  done
done
# -------------- l2_data_assoc benchmarks
i=0;
for bench in "${!benchmarks_executable[@]}"; do
  dirout="${benchmarks_name[$i]}"  #
  ((i+=1))
  for l2d in ${l2_data_assoc[*]}; do
      $gem5_dir/build/ARM/gem5.opt -d ${benchmarks_output}/${dirout}/l2d_assoc.${l2d} $gem5_dir/configs/example/se.py --cpu-type=${cpu_types[0]} --caches --l2cache --l1d_size=${l1_data_size[0]} --l1i_size=${l1_instruction_size[0]} --l2_size=${l2_size[0]} --l1i_assoc=${l1_instruction_assoc[0]} --l1d_assoc=${l1_data_assoc[0]} --l2_assoc=$l2d --cacheline_size=${cacheline_size[0]} --cpu-clock=${cpu_clock[0]} -c $bench "${benchmarks_executable[$bench]}" -I $instructions_num
  done
done
# -------------- cacheline_size benchmarks
i=0;
for bench in "${!benchmarks_executable[@]}"; do
  dirout="${benchmarks_name[$i]}"  #
  ((i+=1))
  for csl in ${cacheline_size[*]}; do
      $gem5_dir/build/ARM/gem5.opt -d ${benchmarks_output}/${dirout}/cacheline.${csl} $gem5_dir/configs/example/se.py --cpu-type=${cpu_types[0]} --caches --l2cache --l1d_size=${l1_data_size[0]} --l1i_size=${l1_instruction_size[0]} --l2_size=${l2_size[0]} --l1i_assoc=${l1_instruction_assoc[0]} --l1d_assoc=${l1_data_assoc[0]} --l2_assoc=${l2_data_assoc[0]} --cacheline_size=$csl --cpu-clock=${cpu_clock[0]} -c $bench "${benchmarks_executable[$bench]}" -I $instructions_num
  done
done
# -------------- cpu_clock benchmarks
i=0;
for bench in "${!benchmarks_executable[@]}"; do
  dirout="${benchmarks_name[$i]}"  #
  ((i+=1))
  for cpc in ${cpu_clock[*]}; do
      $gem5_dir/build/ARM/gem5.opt -d ${benchmarks_output}/${dirout}/cpu_clock.${cpc} $gem5_dir/configs/example/se.py --cpu-type=${cpu_types[0]} --caches --l2cache --l1d_size=${l1_data_size[0]} --l1i_size=${l1_instruction_size[0]} --l2_size=${l2_size[0]} --l1i_assoc=${l1_instruction_assoc[0]} --l1d_assoc=${l1_data_assoc[0]} --l2_assoc=${l2_data_assoc[0]} --cacheline_size=${cacheline_size[0]} --cpu-clock=$cpc -c $bench "${benchmarks_executable[$bench]}" -I $instructions_num
  done
done

echo "Extracting Results"
echo "[Benchmarks]" > results_dirs
for i in $(ls ./Benchmarks_results/specbzip/); do echo ./Benchmarks_results/specbzip/$i >> results_dirs; done
echo "[Parameters]" >> results_dirs
echo "system.cpu.cpi" >> results_dirs
echo "[Output]" >> results_dirs
echo "Results_specbzip" >> results_dirs

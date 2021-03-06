set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.6511, <2> 11.6347, <3> 16.772, <4> 23.586, <5> 32.2584, <6> 34.6058, <7> 33.8704, <8> 18.0757, <9> 44.3376, <10> 20.9078, <11> 34.351, <12> 45.9037, <13> 7.5586, <14> 47.4034, <15> 6.9977, <16> 47.4033, <17> 38.1069, <18> 41.6192, <19> 15.6823, <20> 10.2953;
param workload[JOB] := <1> 4.4052, <2> 31.6533, <3> 28.0945, <4> 33.9069, <5> 12.2739, <6> 27.0628, <7> 25.6661, <8> 4.54, <9> 36.656, <10> 11.5655, <11> 31.8635, <12> 42.4121, <13> 29.8596, <14> 8.6542, <15> 26.5696, <16> 2.2822, <17> 36.131, <18> 7.3415, <19> 30.1977, <20> 7.5425;
param capacity[MACHINE] := <1> 438.6781, <2> 438.6781, <3> 438.6781, <4> 438.6781, <5> 438.6781, <6> 438.6781, <7> 438.6781;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;

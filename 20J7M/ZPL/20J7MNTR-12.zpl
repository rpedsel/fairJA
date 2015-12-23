set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.0025, <2> 21.2551, <3> 24.069, <4> 23.9162, <5> 23.7643, <6> 29.2087, <7> 23.4065, <8> 23.2044, <9> 18.41, <10> 15.0594, <11> 21.8994, <12> 27.0611, <13> 21.5934, <14> 19.176, <15> 26.4832, <16> 29.1849, <17> 22.5317, <18> 29.8978, <19> 27.407, <20> 13.51;
param workload[JOB] := <1> 14.2811, <2> 26.3526, <3> 5.9152, <4> 49.2479, <5> 13.7543, <6> 17.6509, <7> 2.3464, <8> 38.4308, <9> 42.4558, <10> 7.2965, <11> 21.2901, <12> 28.821, <13> 20.4432, <14> 30.198, <15> 43.1638, <16> 4.7361, <17> 7.6303, <18> 4.1208, <19> 17.419, <20> 40.157;
param capacity[MACHINE] := <1> 46.6833, <2> 46.6833, <3> 46.6833, <4> 46.6833, <5> 46.6833, <6> 46.6833, <7> 46.6833;

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

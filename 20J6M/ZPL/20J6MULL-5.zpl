set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.2502, <2> 41.3582, <3> 22.5351, <4> 25.2333, <5> 36.1988, <6> 8.1943, <7> 24.1262, <8> 14.3997, <9> 46.9054, <10> 1.5283, <11> 18.7922, <12> 13.8898, <13> 47.0258, <14> 23.4985, <15> 1.2409, <16> 16.1135, <17> 49.6298, <18> 40.8761, <19> 19.5869, <20> 20.2572;
param workload[JOB] := <1> 35.2502, <2> 41.3582, <3> 22.5351, <4> 25.2333, <5> 36.1988, <6> 8.1943, <7> 24.1262, <8> 14.3997, <9> 46.9054, <10> 1.5283, <11> 18.7922, <12> 13.8898, <13> 47.0258, <14> 23.4985, <15> 1.2409, <16> 16.1135, <17> 49.6298, <18> 40.8761, <19> 19.5869, <20> 20.2572;
param capacity[MACHINE] := <1> 84.44, <2> 84.44, <3> 84.44, <4> 84.44, <5> 84.44, <6> 84.44;

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

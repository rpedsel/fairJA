set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.5131, <2> 12.9049, <3> 13.1286, <4> 29.1237, <5> 31.4554, <6> 30.0322, <7> 33.7537, <8> 10.9323, <9> 20.696, <10> 27.0182;
param workload[JOB] := <1> 931.0493, <2> 166.5364, <3> 172.3601, <4> 848.1899, <5> 989.4422, <6> 901.933, <7> 1139.3123, <8> 119.5152, <9> 428.3244, <10> 729.9831;
param capacity[MACHINE] := <1> 2142.2153, <2> 2142.2153, <3> 2142.2153;

var x[JM] binary;
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

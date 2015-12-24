set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.532, <2> 49.3809, <3> 47.6904, <4> 38.2489, <5> 40.9732, <6> 38.2213, <7> 41.5619, <8> 29.3851, <9> 12.8185, <10> 47.058, <11> 47.9369, <12> 34.9326, <13> 3.0148, <14> 46.4518, <15> 14.4304, <16> 27.9037, <17> 17.0391, <18> 43.764, <19> 49.9022, <20> 2.1705;
param workload[JOB] := <1> 44.532, <2> 49.3809, <3> 47.6904, <4> 38.2489, <5> 40.9732, <6> 38.2213, <7> 41.5619, <8> 29.3851, <9> 12.8185, <10> 47.058, <11> 47.9369, <12> 34.9326, <13> 3.0148, <14> 46.4518, <15> 14.4304, <16> 27.9037, <17> 17.0391, <18> 43.764, <19> 49.9022, <20> 2.1705;
param capacity[MACHINE] := <1> 96.7737, <2> 96.7737, <3> 96.7737, <4> 96.7737, <5> 96.7737, <6> 96.7737, <7> 96.7737;

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

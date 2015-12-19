set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.7726, <2> 15.2659, <3> 25.6708, <4> 21.2419, <5> 19.0203, <6> 23.5456, <7> 39.5678, <8> 32.9469, <9> 13.2063, <10> 21.536;
param workload[JOB] := <1> 30.7726, <2> 15.2659, <3> 25.6708, <4> 21.2419, <5> 19.0203, <6> 23.5456, <7> 39.5678, <8> 32.9469, <9> 13.2063, <10> 21.536;
param capacity[MACHINE] := <1> 242.7741, <2> 242.7741, <3> 242.7741;

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

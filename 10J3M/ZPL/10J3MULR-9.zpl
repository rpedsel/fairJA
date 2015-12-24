set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.0404, <2> 0.95, <3> 12.0785, <4> 11.492, <5> 19.6255, <6> 14.4935, <7> 15.5767, <8> 20.016, <9> 49.985, <10> 43.3116;
param workload[JOB] := <1> 1.3615, <2> 39.3581, <3> 10.8441, <4> 35.5005, <5> 9.3142, <6> 36.0121, <7> 35.8453, <8> 47.0002, <9> 30.1996, <10> 29.4251;
param capacity[MACHINE] := <1> 91.6202, <2> 91.6202, <3> 91.6202;

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

set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.9422, <2> 17.2961, <3> 16.8379, <4> 17.1757, <5> 11.1512, <6> 17.4692, <7> 18.3724, <8> 37.7779, <9> 40.1995, <10> 49.6706;
param workload[JOB] := <1> 37.6677, <2> 5.2009, <3> 17.7643, <4> 44.0807, <5> 37.9986, <6> 35.7387, <7> 49.9776, <8> 25.3, <9> 2.2643, <10> 15.298;
param capacity[MACHINE] := <1> 90.4303, <2> 90.4303, <3> 90.4303;

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

set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3218, <2> 27.0668, <3> 20.7235, <4> 32.5991, <5> 32.2331, <6> 24.0495, <7> 24.0834, <8> 20.1997, <9> 33.4519, <10> 28.7023;
param workload[JOB] := <1> 28.6311, <2> 40.6031, <3> 1.2444, <4> 25.29, <5> 29.0603, <6> 4.8325, <7> 36.7115, <8> 40.1252, <9> 29.556, <10> 45.6921;
param capacity[MACHINE] := <1> 281.7462, <2> 281.7462, <3> 281.7462;

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

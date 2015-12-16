set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.7443, <2> 13.3644, <3> 9.0595, <4> 6.2044, <5> 4.4738, <6> 34.8302, <7> 19.1701, <8> 1.3082, <9> 16.3767, <10> 15.1235;
param workload[JOB] := <1> 3.7443, <2> 13.3644, <3> 9.0595, <4> 6.2044, <5> 4.4738, <6> 34.8302, <7> 19.1701, <8> 1.3082, <9> 16.3767, <10> 15.1235;
param capacity[MACHINE] := <1> 30.9138, <2> 30.9138, <3> 30.9138;

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

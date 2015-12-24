set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.5714, <2> 18.6577, <3> 43.9309, <4> 21.0806, <5> 32.8429, <6> 32.929, <7> 43.3204, <8> 17.548, <9> 13.3289, <10> 0.1851;
param workload[JOB] := <1> 5.1547, <2> 4.3195, <3> 6.628, <4> 4.5914, <5> 5.7309, <6> 5.7384, <7> 6.5818, <8> 4.189, <9> 3.6509, <10> 0.4302;
param capacity[MACHINE] := <1> 47.0148, <2> 47.0148, <3> 47.0148;

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

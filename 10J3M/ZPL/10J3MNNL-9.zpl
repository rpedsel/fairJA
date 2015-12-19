set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.6423, <2> 30.4349, <3> 27.6234, <4> 20.507, <5> 27.3599, <6> 11.1864, <7> 24.9486, <8> 17.6969, <9> 22.7229, <10> 25.0632;
param workload[JOB] := <1> 23.6423, <2> 30.4349, <3> 27.6234, <4> 20.507, <5> 27.3599, <6> 11.1864, <7> 24.9486, <8> 17.6969, <9> 22.7229, <10> 25.0632;
param capacity[MACHINE] := <1> 231.1855, <2> 231.1855, <3> 231.1855;

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

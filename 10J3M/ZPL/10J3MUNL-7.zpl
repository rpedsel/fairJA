set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.3938, <2> 16.5519, <3> 32.693, <4> 3.7699, <5> 39.8765, <6> 3.5269, <7> 40.7693, <8> 7.4914, <9> 20.9721, <10> 31.1679;
param workload[JOB] := <1> 14.3938, <2> 16.5519, <3> 32.693, <4> 3.7699, <5> 39.8765, <6> 3.5269, <7> 40.7693, <8> 7.4914, <9> 20.9721, <10> 31.1679;
param capacity[MACHINE] := <1> 211.2127, <2> 211.2127, <3> 211.2127;

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

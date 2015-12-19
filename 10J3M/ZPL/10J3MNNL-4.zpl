set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.8127, <2> 22.3476, <3> 26.1111, <4> 20.4795, <5> 23.0371, <6> 24.8721, <7> 25.4215, <8> 25.8512, <9> 15.5962, <10> 15.3267;
param workload[JOB] := <1> 27.8127, <2> 22.3476, <3> 26.1111, <4> 20.4795, <5> 23.0371, <6> 24.8721, <7> 25.4215, <8> 25.8512, <9> 15.5962, <10> 15.3267;
param capacity[MACHINE] := <1> 226.8557, <2> 226.8557, <3> 226.8557;

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

set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0664, <2> 17.5389, <3> 26.1421, <4> 27.2394, <5> 20.7669, <6> 33.3437, <7> 18.5288, <8> 31.4895, <9> 26.2651, <10> 28.6162;
param workload[JOB] := <1> 579.1916, <2> 307.613, <3> 683.4094, <4> 741.9849, <5> 431.2641, <6> 1111.8023, <7> 343.3164, <8> 991.5886, <9> 689.8555, <10> 818.8869;
param capacity[MACHINE] := <1> 2232.9709, <2> 2232.9709, <3> 2232.9709;

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

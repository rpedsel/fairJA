set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0122, <2> 32.8082, <3> 16.422, <4> 42.0884, <5> 6.0933, <6> 32.4153, <7> 19.4417, <8> 36.2726, <9> 9.0539, <10> 13.6857, <11> 26.3704, <12> 40.5336, <13> 49.1104, <14> 13.0174, <15> 47.7127, <16> 41.0083, <17> 22.3246, <18> 6.3735, <19> 48.5972, <20> 32.7043;
param workload[JOB] := <1> 23.0122, <2> 32.8082, <3> 16.422, <4> 42.0884, <5> 6.0933, <6> 32.4153, <7> 19.4417, <8> 36.2726, <9> 9.0539, <10> 13.6857, <11> 26.3704, <12> 40.5336, <13> 49.1104, <14> 13.0174, <15> 47.7127, <16> 41.0083, <17> 22.3246, <18> 6.3735, <19> 48.5972, <20> 32.7043;
param capacity[MACHINE] := <1> 559.0457, <2> 559.0457, <3> 559.0457, <4> 559.0457, <5> 559.0457, <6> 559.0457, <7> 559.0457;

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

set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.216, <2> 24.77, <3> 22.0772, <4> 29.2202, <5> 24.4544, <6> 28.601, <7> 24.453, <8> 19.8338, <9> 30.6469, <10> 32.2624, <11> 28.0343, <12> 28.1116, <13> 28.9433, <14> 27.5337, <15> 27.2198, <16> 23.6943, <17> 25.4657, <18> 20.752, <19> 27.0388, <20> 33.2514;
param workload[JOB] := <1> 21.216, <2> 24.77, <3> 22.0772, <4> 29.2202, <5> 24.4544, <6> 28.601, <7> 24.453, <8> 19.8338, <9> 30.6469, <10> 32.2624, <11> 28.0343, <12> 28.1116, <13> 28.9433, <14> 27.5337, <15> 27.2198, <16> 23.6943, <17> 25.4657, <18> 20.752, <19> 27.0388, <20> 33.2514;
param capacity[MACHINE] := <1> 65.9475, <2> 65.9475, <3> 65.9475, <4> 65.9475, <5> 65.9475, <6> 65.9475;

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

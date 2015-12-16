set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0676, <2> 27.5109, <3> 30.6043, <4> 22.1995, <5> 26.1755, <6> 26.3905, <7> 23.2698, <8> 24.3828, <9> 27.0727, <10> 32.4659, <11> 19.8289, <12> 24.4091, <13> 22.5783, <14> 22.7706, <15> 25.4445, <16> 35.0001, <17> 34.1816, <18> 21.0588, <19> 21.3978, <20> 23.7228;
param workload[JOB] := <1> 22.0676, <2> 27.5109, <3> 30.6043, <4> 22.1995, <5> 26.1755, <6> 26.3905, <7> 23.2698, <8> 24.3828, <9> 27.0727, <10> 32.4659, <11> 19.8289, <12> 24.4091, <13> 22.5783, <14> 22.7706, <15> 25.4445, <16> 35.0001, <17> 34.1816, <18> 21.0588, <19> 21.3978, <20> 23.7228;
param capacity[MACHINE] := <1> 64.0665, <2> 64.0665, <3> 64.0665, <4> 64.0665, <5> 64.0665, <6> 64.0665;

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

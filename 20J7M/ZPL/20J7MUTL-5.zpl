set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.5478, <2> 0.8812, <3> 19.2837, <4> 7.0464, <5> 3.4998, <6> 40.9759, <7> 9.2337, <8> 44.7491, <9> 14.6096, <10> 17.4662, <11> 17.1586, <12> 36.2852, <13> 48.4538, <14> 46.7146, <15> 37.9822, <16> 28.4598, <17> 0.6162, <18> 13.5059, <19> 44.4709, <20> 22.3405;
param workload[JOB] := <1> 35.5478, <2> 0.8812, <3> 19.2837, <4> 7.0464, <5> 3.4998, <6> 40.9759, <7> 9.2337, <8> 44.7491, <9> 14.6096, <10> 17.4662, <11> 17.1586, <12> 36.2852, <13> 48.4538, <14> 46.7146, <15> 37.9822, <16> 28.4598, <17> 0.6162, <18> 13.5059, <19> 44.4709, <20> 22.3405;
param capacity[MACHINE] := <1> 52.423, <2> 52.423, <3> 52.423, <4> 52.423, <5> 52.423, <6> 52.423, <7> 52.423;

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

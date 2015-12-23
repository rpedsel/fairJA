set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.9179, <2> 19.5385, <3> 17.882, <4> 17.9977, <5> 11.99, <6> 19.4117, <7> 28.285, <8> 20.5469, <9> 19.4241, <10> 28.4697, <11> 33.1627, <12> 24.4901, <13> 29.0693, <14> 19.4876, <15> 26.5171, <16> 25.348, <17> 21.0881, <18> 31.4461, <19> 23.3656, <20> 21.3812;
param workload[JOB] := <1> 4.8906, <2> 4.4202, <3> 4.2287, <4> 4.2424, <5> 3.4627, <6> 4.4059, <7> 5.3184, <8> 4.5329, <9> 4.4073, <10> 5.3357, <11> 5.7587, <12> 4.9487, <13> 5.3916, <14> 4.4145, <15> 5.1495, <16> 5.0347, <17> 4.5922, <18> 5.6077, <19> 4.8338, <20> 4.624;
param capacity[MACHINE] := <1> 10.2429, <2> 10.2429, <3> 10.2429, <4> 10.2429, <5> 10.2429, <6> 10.2429, <7> 10.2429;

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

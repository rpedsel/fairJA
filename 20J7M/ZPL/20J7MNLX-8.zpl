set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.4659, <2> 23.5052, <3> 22.6709, <4> 21.8725, <5> 21.9025, <6> 12.7944, <7> 27.4495, <8> 24.0703, <9> 33.8442, <10> 26.8856, <11> 12.7758, <12> 20.3362, <13> 25.8294, <14> 19.8812, <15> 30.2197, <16> 26.1876, <17> 22.7725, <18> 26.9474, <19> 28.855, <20> 31.7994;
param workload[JOB] := <1> 4.6331, <2> 4.8482, <3> 4.7614, <4> 4.6768, <5> 4.68, <6> 3.5769, <7> 5.2392, <8> 4.9061, <9> 5.8176, <10> 5.1851, <11> 3.5743, <12> 4.5096, <13> 5.0823, <14> 4.4588, <15> 5.4972, <16> 5.1174, <17> 4.7721, <18> 5.1911, <19> 5.3717, <20> 5.6391;
param capacity[MACHINE] := <1> 13.934, <2> 13.934, <3> 13.934, <4> 13.934, <5> 13.934, <6> 13.934, <7> 13.934;

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

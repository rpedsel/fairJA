set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.934, <2> 32.893, <3> 25.6799, <4> 18.6287, <5> 27.6889, <6> 37.8447, <7> 10.4579, <8> 21.0438, <9> 28.7626, <10> 22.7185, <11> 20.128, <12> 34.9739, <13> 40.0142, <14> 41.2175, <15> 34.0331, <16> 27.5859, <17> 34.2531, <18> 24.4406, <19> 6.3384, <20> 37.901;
param workload[JOB] := <1> 3.3067, <2> 5.7352, <3> 5.0675, <4> 4.3161, <5> 5.262, <6> 6.1518, <7> 3.2339, <8> 4.5874, <9> 5.3631, <10> 4.7664, <11> 4.4864, <12> 5.9139, <13> 6.3257, <14> 6.4201, <15> 5.8338, <16> 5.2522, <17> 5.8526, <18> 4.9437, <19> 2.5176, <20> 6.1564;
param capacity[MACHINE] := <1> 101.4925, <2> 101.4925, <3> 101.4925, <4> 101.4925, <5> 101.4925, <6> 101.4925;

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

set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.4441, <2> 22.7238, <3> 25.6162, <4> 21.3419, <5> 31.4468, <6> 23.7238, <7> 31.9825, <8> 32.21, <9> 21.6388, <10> 29.7006, <11> 29.9435, <12> 13.7677, <13> 14.0915, <14> 30.1582, <15> 23.7944, <16> 19.3304, <17> 28.3742, <18> 32.3378, <19> 27.2302, <20> 27.7361;
param workload[JOB] := <1> 5.1424, <2> 4.7669, <3> 5.0612, <4> 4.6197, <5> 5.6077, <6> 4.8707, <7> 5.6553, <8> 5.6754, <9> 4.6518, <10> 5.4498, <11> 5.4721, <12> 3.7105, <13> 3.7539, <14> 5.4916, <15> 4.878, <16> 4.3966, <17> 5.3267, <18> 5.6866, <19> 5.2183, <20> 5.2665;
param capacity[MACHINE] := <1> 10.7895, <2> 10.7895, <3> 10.7895, <4> 10.7895, <5> 10.7895, <6> 10.7895, <7> 10.7895;

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

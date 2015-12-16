set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.133, <2> 30.5098, <3> 19.8133, <4> 29.2822, <5> 20.3215, <6> 23.837, <7> 22.7565, <8> 19.7862, <9> 19.1311, <10> 23.734, <11> 23.8854, <12> 21.3206, <13> 27.7044, <14> 31.5329, <15> 27.4057, <16> 15.5709, <17> 31.6502, <18> 29.8359, <19> 22.1922, <20> 27.63;
param workload[JOB] := <1> 38.5361, <2> 48.3156, <3> 45.7732, <4> 35.0467, <5> 43.8465, <6> 20.5985, <7> 31.2742, <8> 30.7025, <9> 47.7836, <10> 41.5084, <11> 19.2712, <12> 21.3145, <13> 43.2442, <14> 32.0563, <15> 21.0857, <16> 9.6759, <17> 0.2643, <18> 38.0187, <19> 19.4616, <20> 28.2241;
param capacity[MACHINE] := <1> 77.0002, <2> 77.0002, <3> 77.0002, <4> 77.0002, <5> 77.0002, <6> 77.0002;

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

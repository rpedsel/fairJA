set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.9032, <2> 19.4972, <3> 18.8184, <4> 31.1842, <5> 17.9254, <6> 22.4796, <7> 27.0307, <8> 35.9165, <9> 19.0381, <10> 22.4449, <11> 16.1903, <12> 31.4349, <13> 19.7629, <14> 24.4424, <15> 31.5696, <16> 28.567, <17> 20.0031, <18> 21.8991, <19> 28.3861, <20> 23.9353;
param workload[JOB] := <1> 4.7857, <2> 4.4156, <3> 4.338, <4> 5.5843, <5> 4.2338, <6> 4.7413, <7> 5.1991, <8> 5.993, <9> 4.3633, <10> 4.7376, <11> 4.0237, <12> 5.6067, <13> 4.4455, <14> 4.9439, <15> 5.6187, <16> 5.3448, <17> 4.4725, <18> 4.6796, <19> 5.3279, <20> 4.8924;
param capacity[MACHINE] := <1> 97.7474, <2> 97.7474, <3> 97.7474, <4> 97.7474, <5> 97.7474, <6> 97.7474;

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

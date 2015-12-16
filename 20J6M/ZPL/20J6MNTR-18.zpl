set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.2604, <2> 27.9434, <3> 27.4183, <4> 24.0207, <5> 18.7456, <6> 17.6581, <7> 29.9052, <8> 18.3088, <9> 22.0121, <10> 27.8162, <11> 33.3774, <12> 33.2185, <13> 14.6903, <14> 26.9092, <15> 22.6453, <16> 18.9315, <17> 33.166, <18> 21.1316, <19> 19.4129, <20> 38.9613;
param workload[JOB] := <1> 48.1318, <2> 14.7019, <3> 44.0005, <4> 22.8114, <5> 9.3199, <6> 33.1741, <7> 18.0133, <8> 26.5709, <9> 26.1818, <10> 16.8518, <11> 26.6329, <12> 22.7703, <13> 46.6874, <14> 26.9563, <15> 42.9029, <16> 26.5063, <17> 2.0025, <18> 15.1463, <19> 17.8523, <20> 29.509;
param capacity[MACHINE] := <1> 64.5905, <2> 64.5905, <3> 64.5905, <4> 64.5905, <5> 64.5905, <6> 64.5905;

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

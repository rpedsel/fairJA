set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.1057, <2> 24.9803, <3> 28.1565, <4> 27.4991, <5> 31.8229, <6> 22.5037, <7> 23.712, <8> 22.6449, <9> 32.2748, <10> 30.457, <11> 24.6427, <12> 16.207, <13> 28.0955, <14> 27.9013, <15> 29.3129, <16> 18.7978, <17> 28.1613, <18> 30.7434, <19> 27.8013, <20> 25.4757;
param workload[JOB] := <1> 43.022, <2> 29.0224, <3> 39.6018, <4> 27.3099, <5> 44.7745, <6> 33.9517, <7> 9.475, <8> 30.4784, <9> 27.6708, <10> 2.674, <11> 6.6855, <12> 16.4022, <13> 9.1331, <14> 32.5289, <15> 1.1965, <16> 41.6298, <17> 40.8126, <18> 38.7345, <19> 4.1292, <20> 31.7037;
param capacity[MACHINE] := <1> 54.7432, <2> 54.7432, <3> 54.7432, <4> 54.7432, <5> 54.7432, <6> 54.7432, <7> 54.7432;

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

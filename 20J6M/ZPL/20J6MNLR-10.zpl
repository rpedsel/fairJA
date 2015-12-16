set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.052, <2> 35.8605, <3> 22.0602, <4> 20.5781, <5> 28.6524, <6> 26.5137, <7> 24.8331, <8> 30.1443, <9> 22.3604, <10> 32.5702, <11> 30.1482, <12> 21.5712, <13> 31.8846, <14> 26.041, <15> 21.7106, <16> 21.9538, <17> 19.2087, <18> 20.3548, <19> 32.5593, <20> 32.4462;
param workload[JOB] := <1> 16.3795, <2> 43.4805, <3> 28.188, <4> 43.9342, <5> 12.8693, <6> 20.6362, <7> 45.9482, <8> 46.3366, <9> 23.06, <10> 32.7731, <11> 10.9478, <12> 21.4249, <13> 33.5325, <14> 12.5271, <15> 12.9896, <16> 35.5015, <17> 7.4326, <18> 25.4123, <19> 6.7039, <20> 31.0911;
param capacity[MACHINE] := <1> 85.1948, <2> 85.1948, <3> 85.1948, <4> 85.1948, <5> 85.1948, <6> 85.1948;

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
